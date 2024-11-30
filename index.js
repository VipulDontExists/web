import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

import { createBrowserRouter } from 'react-router-dom';
import { RouterProvider } from 'react-router-dom';
import Form from './pages/Form';

const root = ReactDOM.createRoot(document.getElementById('root'));
let allRoutes=createBrowserRouter(
  [
    {
      path: '/',
      element: <App/>
    },

    {
      path: 'form',
      element:  <Form/>
    } 
     
  ]
)



root.render(
  <React.StrictMode>
  <RouterProvider router={allRoutes} />
 </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();


