const express = require("express");
const authorsRouter = express.Router();
const db = require("../database/client");

// 1.Get all authors:
authorsRouter.get("/", (req, res) => {
  db.query("SELECT * FROM authors ORDER BY author_id ASC")
    .then((data) => res.json(data.rows))
    .catch((error) => res.status(500).send(error.message));
});

// 2.Get one post
authorsRouter.get("/:id", (req, res) => {
  const { id } = req.params;
  const getOneAuthor = {
    text: `SELECT * FROM authors
            WHERE author_id = $1`,
    values: [id],
  };
  db.query(getOneAuthor)
    .then((data) => res.json(data.rows))
    .catch((error) => res.status(500).send(error.message));
});

// 3. get all posts written by a specific author
authorsRouter.get("/:id/posts", (req, res) => {
  const { id } = req.params;
  const getAuthorPosts = {
    text: `SELECT
          headline,
          post_id
          FROM
          posts p
          INNER JOIN authors a
           ON p.author_id = a.author_id
          WHERE p.author_id = $1;`,
    values: [id],
  };
  db.query(getAuthorPosts)
    .then((data) => {
      if (!data.rows.length) {
        return res.status(404).send("Author not found");
      }
      res.json(data.rows);
    })
    .catch((error) => res.status(500).send(error.message));
});

module.exports = authorsRouter;
