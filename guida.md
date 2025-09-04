### **Guida al Progetto IUM-TWEB: Architettura a Microservizi per l'Esplorazione di Dati Cinematografici**

Questo documento descrive l'architettura e le componenti del progetto, pensato per soddisfare i requisiti accademici attraverso un'implementazione moderna e robusta.

#### **1. Architettura Generale**

Il progetto adotta un'architettura a microservizi, progettata per separare le responsabilità, migliorare la manutenibilità e garantire alte prestazioni. L'architettura si compone di tre server principali:

1.  **Server Centrale (Aggregatore/API Gateway)**: Un'applicazione Node.js/Express che funge da unico punto di ingresso per il client. Ha il duplice ruolo di servire l'interfaccia utente e di orchestrare le chiamate agli altri servizi di backend.
2.  **Backend per Dati Statici**: Un'applicazione Java/Spring Boot che gestisce i dati a bassa frequenza di modifica (es. informazioni su film, attori, premi Oscar).
3.  **Backend per Dati Dinamici**: Un'applicazione Node.js/Express dedicata alla gestione dei dati che cambiano rapidamente (es. recensioni).

Questa architettura rispetta il requisito fondamentale: il server centrale rimane leggero e veloce, delegando le operazioni "pesanti" (interrogazioni al database) a servizi specializzati.



#### **2. Dettaglio dei Componenti**

**2.1. Frontend e Server Centrale (Aggregatore)**

*   **Directory**: `solution/frontend/`
*   **Tecnologie**: Node.js, Express, Handlebars.js, CSS, HTML5.
*   **Descrizione**: Questo server ha una duplice responsabilità:
    1.  **UI Server**: Serve i file statici che compongono l'interfaccia utente (`public/html/mainView.html`, fogli di stile, e script JS). Utilizza Handlebars (`views/*.hbs`) come motore di templating per generare dinamicamente parti dell'HTML, come le schede dei film.
    2.  **API Gateway**: Espone le API che il client interroga. Quando riceve una richiesta, non accede direttamente a un database, ma chiama gli altri due servizi backend (Java e Express), ne aggrega i risultati e li restituisce al client in un'unica risposta. Questo lo rende estremamente reattivo e scalabile.
*   **File Chiave**:
    *   `app.js`: Entry point del server Express.
    *   `public/js/api.js`: Contiene la logica per effettuare chiamate `fetch` verso le API del server centrale.
    *   `public/js/main.js`: Logica principale dell'interfaccia utente, gestione degli eventi e interazione con `api.js`.
    *   `public/js/views.js`: Funzioni per renderizzare i dati ricevuti dal server utilizzando i template Handlebars.
    *   `views/`: Contiene i template Handlebars (`.hbs`) per le componenti riutilizzabili dell'interfaccia.

**2.2. Backend Service: Dati Statici (Java/Spring Boot)**

*   **Directory**: `solution/backend/springboot/moviesProject/`
*   **Tecnologie**: Java 17, Spring Boot, Spring Data JPA, PostgreSQL.
*   **Descrizione**: Questo servizio è responsabile della gestione dei dati "statici" del dominio cinematografico. Espone API REST per interrogare informazioni su film, attori, generi, etc.
*   **Database**: Come confermato dai file `build.gradle` (che include la dipendenza `org.postgresql:postgresql`) e `application.properties` (che definisce il `spring.datasource.url=jdbc:postgresql://...`), questo servizio utilizza un database **PostgreSQL**. Questo soddisfa pienamente il requisito del corso.
*   **File Chiave**:
    *   `MoviesProjectApplication.java`: Classe principale di avvio di Spring Boot.
    *   `MovieController.java`: Controller REST che espone gli endpoint per le ricerche sui film.
    *   `Movie.java`, `Actor.java`, `OscarAward.java`: Entità JPA che modellano i dati e vengono mappate sulle tabelle del database PostgreSQL.
    *   `MovieRepository.java`: Interfaccia Spring Data JPA per l'accesso ai dati dei film.
    *   `build.gradle`: Definisce le dipendenze del progetto, inclusi Spring Web, JPA e il driver PostgreSQL.
    *   `application.properties`: Contiene le configurazioni, inclusa la stringa di connessione al database.

**2.3. Backend Service: Dati Dinamici (Node.js/Express)**

*   **Directory**: `solution/backend/express/`
*   **Tecnologie**: Node.js, Express, MongoDB.
*   **Descrizione**: Questo microservizio gestisce i dati "dinamici", come le recensioni degli utenti. La scelta di MongoDB è ideale per dati non strutturati o semi-strutturati che possono cambiare rapidamente.
*   **Database**: Il file `databases/mongoConnect.js` indica la connessione a un'istanza di **MongoDB**, in linea con i requisiti.
*   **File Chiave**:
    *   `app.js`: Entry point del server Express.
    *   `controllers/reviewsController.js`: Contiene la logica per gestire le operazioni CRUD (Create, Read, Update, Delete) sulle recensioni.
    *   `models/reviews.js`: Definisce lo schema dei dati per le recensioni utilizzando Mongoose (presumibilmente).
    *   `databases/mongoConnect.js`: Gestisce la connessione al database MongoDB.

#### **3. Flusso di una Richiesta Tipo (Ricerca Film)**

1.  L'utente digita il titolo di un film nella `mainView.html` e preme "Cerca".
2.  `main.js` cattura l'evento, legge l'input e invoca una funzione in `api.js`.
3.  `api.js` invia una richiesta (es. `GET /api/movies?title=Inception`) al **Server Centrale (Aggregatore)**.
4.  Il Server Centrale riceve la richiesta e, in parallelo:
    *   Invia una richiesta al **servizio Spring Boot** (es. `GET /movies?title=Inception`) per ottenere i dettagli statici del film.
    *   Invia una richiesta al **servizio Express delle recensioni** (es. `GET /reviews?movieId=...`) per ottenere le recensioni.
5.  I due servizi di backend interrogano i rispettivi database (PostgreSQL e MongoDB) e restituiscono i dati al Server Centrale.
6.  Il Server Centrale aggrega le due risposte in un unico oggetto JSON e lo invia come risposta al client.
7.  Il client (in `api.js` o `main.js`) riceve il JSON, lo passa a `views.js` che usa un template Handlebars (`movie-detail.hbs`) per generare l'HTML e mostrarlo all'utente.

#### **4. Funzionalità Aggiuntiva: Chat in Tempo Reale**

Nella cartella `solution/frontend/socket/` è presente un `chatServer.js`, che suggerisce l'implementazione di una funzionalità di chat in tempo reale tramite **WebSockets** (probabilmente con la libreria `socket.io`), che arricchisce l'interattività del progetto.

#### **5. Come Avviare il Progetto**

Per eseguire l'intero sistema, è necessario avviare i tre server separatamente:

1.  **Backend (Dati Statici - Java)**:
    *   Navigare in `solution/backend/springboot/moviesProject/`.
    *   Eseguire il comando: `./gradlew bootRun` (su macOS/Linux) o `gradlew.bat bootRun` (su Windows).

2.  **Backend (Dati Dinamici - Node.js)**:
    *   Navigare in `solution/backend/express/`.
    *   Eseguire `npm install` per installare le dipendenze.
    *   Eseguire `npm start`.

3.  **Frontend e Server Centrale (Node.js)**:
    *   Navigare in `solution/frontend/`.
    *   Eseguire `npm install` per installare le dipendenze.
    *   Eseguire `npm start`.

Dopo aver avviato tutti i server, l'applicazione sarà accessibile tramite un browser all'indirizzo del server frontend (tipicamente `http://localhost:3000` o simile).
