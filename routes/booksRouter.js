const express = require("express");
const booksRouter = express.Router();
const db = require("../database/client");

booksRouter.get("/", (req, res, next) => {
  db.query("SELECT * FROM books ORDER BY title ASC;")
    .then((data) => res.json(data.rows))
    .catch((error) => res.status(500).send(error.message));
});

module.exports = booksRouter;
