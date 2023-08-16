import Express from "express";

const app = Express();

app.get("/", async (req, res)=> {
    res.send("Hello World!");
});

app.listen(8000, () => {
    console.log("Server running on 8000...");
});