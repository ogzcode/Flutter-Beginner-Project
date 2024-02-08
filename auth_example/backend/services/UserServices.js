import prisma from "./prismaConfig.js";

export default class UserServices {
    static async createUser(data) {
        return await prisma.user.create({
            data
        });
    }

    static async getUserById(id) {
        return await prisma.user.findUnique({
            where: {
                id
            }
        });
    }

    static async getUserByEmail(email) {
        return await prisma.user.findUnique({
            where: {
                email
            }
        });
    }

    static async updateUser(id, data) {
        return await prisma.user.update({
            where: {
                id
            },
            data
        });
    }

    static async deleteUser(id) {
        return await prisma.user.delete({
            where: {
                id
            }
        });
    }
}