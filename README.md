# Island Tea Co. & Ceylon Coffee Club

A Spring Boot website for Island Tea Co. & Ceylon Coffee Club in Malabe, Sri Lanka. It includes cafe pages, a sample menu, menu search, and reviews. Menu and cafe information is currently seeded in memory; no database is required.

## Requirements

- Java 21
- Apache Maven

Check that Java and Maven are available in your terminal:

```powershell
java -version
mvn -version
```

The Java version should be 21. If `mvn` is not recognized, install Apache Maven, add its `bin` directory to `PATH`, and open a new terminal.

## Run locally

Open PowerShell in the repository folder, then run:

```powershell
cd .\island-tea-webapp
mvn spring-boot:run
```

When the application starts, open [http://localhost:8080](http://localhost:8080). Leave the terminal running while you use the site; press **Ctrl+C** to stop the server.

To build and run an executable JAR instead:

```powershell
cd .\island-tea-webapp
mvn clean package
java -jar .\target\island-tea-webapp.jar
```

On macOS or Linux, use `cd island-tea-webapp` and `java -jar target/island-tea-webapp.jar` for the equivalent commands.

The app uses port 8080 by default. If that port is already in use, choose another port in PowerShell:

```powershell
$env:PORT = "8081"
mvn spring-boot:run
```

Then open [http://localhost:8081](http://localhost:8081). Clear the setting in that terminal with `Remove-Item Env:PORT` when you are done.

## Pages and API

- `/` — home page with signature items and featured reviews
- `/menu` — menu grouped by category, with prefix search
- `/menu/item/{id}` — item details
- `/reviews` — featured reviews and the review timeline
- `/about` — cafe information
- `/api/menu/search?prefix=Ceylon` — search menu items by name prefix
- `/api/menu/sorted-by-price` — menu items ordered by price

## Project structure

```text
island-tea-webapp/
├── pom.xml
└── src/main/
    ├── java/com/islandtea/
    │   ├── controller/       Spring MVC pages and API endpoints
    │   ├── datastructures/   Custom linked list, trie, sorting and search
    │   ├── model/            Cafe, menu, and review domain models
    │   └── service/          Cafe data, menu, and review logic
    └── resources/
        ├── static/css/       Stylesheet
        └── templates/        Thymeleaf pages
```

The project demonstrates object-oriented concepts such as interfaces, inheritance, polymorphism, encapsulation, builders, and comparable models. It also uses a trie for menu prefix search, merge sort and binary search for menu prices, a priority queue for top reviews, a linked list for review ordering, and a stack for recently viewed items.

## Deploy on Render

The repository includes a root-level `Dockerfile` that builds the Java 21 application from `island-tea-webapp/`. This lets Render build the project without a separate monorepo root-directory setting.

1. Sign in to Render and connect the GitHub account that can access `AfkarFaizal/island-tea`.
2. Select **New** → **Web Service**, then connect the `AfkarFaizal/island-tea` repository and the `main` branch.
3. Choose the **Docker** runtime and a plan. The Dockerfile is at the repository root.
4. Create the service and wait for the first deployment to finish. Render will provide a public `onrender.com` URL.

The app reads Render's `PORT` environment variable and binds its web server to that port. No database or other environment variables are required. Render's free web services sleep after 15 minutes without requests and may take a little time to wake up.

## Data

Cafe details and featured reviews are initialized in `island-tea-webapp/src/main/java/com/islandtea/service/CafeDataInitializer.java`. The sample menu is illustrative; update the same file with the cafe's current items and prices.
