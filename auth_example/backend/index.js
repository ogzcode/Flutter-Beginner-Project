import express from 'express';
import cors from 'cors';

import { register, login, getUser, updateUser, deleteUser } from './controller/authController.js';
import { authMiddleware } from './middleware/authMiddleware.js';

const app = express();

app.use(cors());
app.use(express.json());


app.post('/register', register);
app.post('/login', login);
app.get('/user', authMiddleware, getUser);
app.put('/user', authMiddleware, updateUser);
app.delete('/user', authMiddleware, deleteUser);

app.listen(3000, () => {
    console.log('Server running on port 3000');
});
