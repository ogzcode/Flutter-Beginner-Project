import UserServices from "../services/UserServices.js";

export const getAllUsers = async (req, res) => {
    try {
        const users = await UserServices.getAllUser();

        return res.status(201).json({
            users
        })
    }
    catch (e) {
        res.status(400).json({
            message: e.message
        })
    }
}

export const deleteAllUser = async (req, res) => {
    try {
        await UserServices.deleteAllUser();

        res.status(200).json({
            message: "All users deleted"
        })
    }
    catch (e) {
        res.status(400).json({
            message: e.message
        })
    }
}
