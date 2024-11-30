require('dotenv').config();

const mongoose = require('mongoose');

const mongoURI = process.env.MONGO_URI;

mongoose.connect(mongoURI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(() => console.log('Connected to MongoDB'))
.catch(err => console.error('Error connecting to MongoDB:', err));



const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

app.get('/users', (req, res) => {
  res.json([{ id: 1, name: 'John Doe' }]);
});

app.listen(port, () => {
  console.log(`API running at http://localhost:${port}`);
});



const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(() => console.log('Connected to MongoDB'))
.catch(err => console.error('Error connecting to MongoDB:', err));

const userSchema = new mongoose.Schema({
  name: String,
  email: String,
  age: Number,
});

const User = mongoose.model('User', userSchema);

app.get('/users', async (req, res) => {
  try {
    const users = await User.find();
    res.json(users);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
});

require('dotenv').config();
mongoose.connect(process.env.MONGO_URI, {});

import React, { useState, useEffect } from 'react';
import { fetchOrders } from '../services/api';

const App = () => {
    const [searchQuery, setSearchQuery] = useState('');
    const [orders, setOrders] = useState([]);

    useEffect(() => {
        if (searchQuery) {
            handleSearch();
        }
    }, [searchQuery]);

    const handleSearch = async () => {
        try {
            const results = await fetchOrders(searchQuery);
            setOrders(results);
        } catch (error) {
            console.error('Error searching orders:', error);
        }
    };

    return (
        <div>
            <h1>Search Orders</h1>
            <input
                type="text"
                placeholder="Search by customer name"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
            />
            <ul>
                {orders.map((order) => (
                    <li key={order._id}>
                        {order.customerName} - ${order.totalAmount}
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default App;

import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import ImageGallery from './pages/ImageGallery';
import { createBrowserRouter, RouterProvider } from 'react-router-dom';

const routes = createBrowserRouter([
    { path: '/', element: <App /> },
    { path: '/gallery', element: <ImageGallery /> }
]);

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <React.StrictMode>
        <RouterProvider router={routes} />
    </React.StrictMode>
);

