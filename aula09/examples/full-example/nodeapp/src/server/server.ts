import { PrismaClient } from "@prisma/client";
import { randomUUID } from "crypto";
import express from "express";

const app = express();

const prisma = new PrismaClient();

app.get("/", async (req, res) => {

    const users = await prisma.user.findMany();

    res.send(JSON.stringify(users));
});

function generateRandomName(): string {
    const names = ["joao", "maria", "jose", "tiago", "wander"];

    return names[Math.floor(Math.random() * names.length)];
}

function generateRandomUser(): { id: string, name: string } {
    const user = {
        id: randomUUID(),
        name: generateRandomName()
    };

    return user;
}

app.get("/create", async (req, res) => {

    await prisma.user.create({
        data: generateRandomUser()
    });

    res.redirect("http://localhost:3000/");
});

app.listen(3000, () => console.log("Server on port 3000!"));