# Interactive-Trade-Visualizer-with-Firebase-Authentication-MQL5
Overview:

This project is a trade assistant application designed to enhance the trading experience by providing a live trade visualizer for users to simulate and plan trades. The application allows users to log in via a Firebase-based authentication system, retrieve live trading signals from TradingView through a REST API, and visualize profit levels before executing trades. The project demonstrates the effective use of REST APIs, NoSQL database (Firebase), and strong object-oriented programming principles.

Key Features:

User Authentication and Verification:

Login and authentication system using Firebase Authentication to securely store and verify user credentials.
Integration with Zapier to automatically update Firebase credentials based on changes in Google Sheets (providing real-time sync of login details).

Live Trade Visualizer:

An intuitive GUI that allows users to visualize potential profit/loss levels of a trade before execution.
Users can adjust parameters such as stop-loss, take-profit levels, and lot sizes, and see real-time changes on the visualizer.

Integration with TradingView:

Retrieval of real-time trading signals via Pipedream API, which acts as a bridge between TradingView and the application.
Display of relevant signals to help users make informed decisions about their trades.

Technologies Used:

Firebase (NoSQL):

Used for authentication and data storage of user credentials.
The data is dynamically updated through Zapier from Google Sheets, providing a seamless and real-time login experience.

REST APIs:

Pipedream is used to connect and retrieve signals from TradingView via API.
The project showcases your ability to work with multiple API layers and efficiently retrieve, handle, and display data in the GUI.

Object-Oriented Programming (OOP):

The entire project is built using clean OOP principles for better modularity, maintainability, and scalability.
Key OOP principles such as inheritance, polymorphism, and encapsulation are used to create different components like the visualizer, user authentication, and API handling.
Efficient class structures allow for future expansion of the application, like adding new trading features or incorporating additional APIs.

Graphical User Interface (GUI):

The application uses intuitive GUI elements to allow the user to modify trade parameters and visualize their trades in real time without executing them.
A focus on usability ensures that even novice traders can understand and leverage the visualizer to plan trades effectively.

Challenges Solved:

Seamless Login Integration:

Ensuring the login system syncs with Firebase and is automatically updated through Google Sheets using Zapier. This shows your ability to manage real-time data synchronization across platforms.

REST API Handling:

Integrating TradingView signals using Pipedream shows your capability to handle third-party APIs, parsing data efficiently, and updating the front-end in real time.

Trade Visualization:

Implementing a live trade visualization tool that accurately represents profit/loss levels before execution demonstrates your understanding of user experience and real-time data processing.

Why This Project Stands Out:

API Integration: 

This project highlights your ability to integrate complex APIs (Firebase, TradingView via Pipedream) and work with modern tools like Zapier for seamless data updates.

Efficient OOP Design: 

With a focus on strong object-oriented design principles, you’ve created a modular and scalable system that allows for future improvements and extensions.

User-Centric Features: 

The trade visualizer not only displays real-time data but also empowers users to plan their trades visually before they take action, demonstrating your commitment to creating user-friendly applications.
