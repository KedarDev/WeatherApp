import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from "./App/App";

import AppContextProvider from "./Context/applicationContext";
import { Toaster } from "react-hot-toast";

import { BrowserRouter as Router } from "react-router-dom";

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <AppContextProvider>
    <Router>
      <App />
    </Router>
    <Toaster
    toastOptions={{
      duration: 5000,
      style: {
        background: "#7e0bdb",
        color: "#fff"
      }
    }}
    />
  </AppContextProvider>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals

