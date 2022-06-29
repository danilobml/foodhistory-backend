const express = require("express");
const postsRouter = express.Router();
const db = require("../database/client");

// 1.Get all posts:
// postsRouter.get("/", (req, res) => {
//  db.query("SELECT * FROM posts ORDER BY post_id ASC")
//    .then((data) => res.json(data.rows))
//    .catch((error) => res.status(500).send(error.message));
// });

// 1a.Get all posts with pagination:
postsRouter.get("/", (req, res) => {
  const getAllPagination = {
    text: `SELECT *
          FROM posts
          ORDER BY post_id ASC`,
  };

  db.query(getAllPagination)
    .then((data) => res.json(data.rows))
    .catch((error) => res.status(500).send(error.message));
});

// 2.Get one post
postsRouter.get("/:id", (req, res) => {
  const { id } = req.params;
  const getOnePost = {
    text: `SELECT * FROM posts p
           LEFT JOIN authors a
            ON p.author_id = a.author_id
            WHERE post_id = $1`,
    values: [id],
  };
  db.query(getOnePost)
    .then((data) => res.json(data.rows))
    .catch((error) => res.status(500).send(error.message));
});

module.exports = postsRouter;
