const menuSchema = new mongoose.Schema({
  name: String,
  date: Date,
  address: String,
  items: [
    {
      name: String,
      price: Number, 
    }
  ]
});

const Menu = mongoose.model('Menu', menuSchema);

const menuData = {
  name: 'Name', 
  date: new Date(), 
  address: 'Address', 
  items: [
    { name: 'Kachori' },
    { name: 'Chinese Samosa' },
    { name: 'Panjabi Samosa' },
    { name: 'Green Samosa' },
    { name: 'Panjabi Samosa' },
    { name: 'Sada Idli' },
    { name: 'Masala Idli' },
    { name: 'Sada Dhokla' },
    { name: 'White Dhokla' },
  ],
};

insertMenu();

const mongoose = require('mongoose');

const uri = 'mongodb://localhost:27017'; 


async function connectToDatabase() {
  try {
    await mongoose.connect(uri, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log('Connected to MongoDB successfully!');
  } catch (error) {
    console.error('Failed to connect to MongoDB:', error);
  }
}

connectToDatabase();
