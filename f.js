import axios from 'axios';

const API_BASE_URL = 'http://localhost:5000/api'; // Replace with your backend's URL if deployed

export const fetchOrders = async (searchQuery = '') => {
    try {
        const response = await axios.get(`${API_BASE_URL}/orders`, {
            params: { search: searchQuery }
        });
        return response.data;
    } catch (error) {
        console.error('Error fetching orders:', error);
        throw error;
    }
};

export const createOrder = async (orderData) => {
    try {
        const response = await axios.post(`${API_BASE_URL}/orders`, orderData);
        return response.data;
    } catch (error) {
        console.error('Error creating order:', error);
        throw error;
    }
};

export const fetchImages = async () => {
    try {
        const response = await axios.get(`${API_BASE_URL}/images`);
        return response.data;
    } catch (error) {
        console.error('Error fetching images:', error);
        throw error;
    }
};

export const uploadImage = async (imageData) => {
    try {
        const response = await axios.post(`${API_BASE_URL}/images`, imageData);
        return response.data;
    } catch (error) {
        console.error('Error uploading image:', error);
        throw error;
    }
};

import React, { useState, useEffect } from 'react';
import { fetchImages } from '../services/api';

const ImageGallery = () => {
    const [images, setImages] = useState([]);

    useEffect(() => {
        const loadImages = async () => {
            try {
                const imageList = await fetchImages();
                setImages(imageList);
            } catch (error) {
                console.error('Error fetching images:', error);
            }
        };

        loadImages();
    }, []);

    return (
        <div>
            <h1>Image Gallery</h1>
            <div style={{ display: 'flex', flexWrap: 'wrap' }}>
                {images.map((image) => (
                    <div key={image._id} style={{ margin: '10px' }}>
                        <img src={image.imageUrl} alt={image.description} width="200" />
                        <p>{image.description}</p>
                    </div>
                ))}
            </div>
        </div>
    );
};

export default ImageGallery;

