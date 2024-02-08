import UserServices from "../services/UserServices.js";
import jwt from "jsonwebtoken";


export const register = async (req, res) => {
    try {
        const user = await UserServices.createUser(req.body);
        res.status(201).json({
            message: "Sign in successful!"
        });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}

export const login = async (req, res) => {
    try {
        const user = await UserServices.getUserByEmail(req.body.email);
        if (!user) {
            return res.status(400).json({ error: "User not found hello" });
        }
        if (user.password !== req.body.password) {
            return res.status(400).json({ error: "Invalid password" });
        }
        const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET);

        res.status(200).json({ 
            user: {
                id: user.id,
                email: user.email,
                name: user.name
            },
            token
         });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}

export const getUser = async (req, res) => {
    try {
        const user = await UserServices.getUserById(req.user.id);
        res.status(200).json(user);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}

export const updateUser = async (req, res) => {
    try {
        const user = await UserServices.updateUser(req.user.id, req.body);
        res.status(200).json(user);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}

export const deleteUser = async (req, res) => {
    try {
        const user = await UserServices.deleteUser(req.user.id);
        res.status(200).json(user);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}