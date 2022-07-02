const express = require("express");
const postsRouter = express.Router();
const db = require("../database/client");

// 1.Get all posts:
postsRouter.get("/", (req, res) => {
  db.query("SELECT * FROM posts ORDER BY post_id ASC")
    .then((data) => res.json(data.rows))
    .catch((error) => res.status(500).send(error.message));
});

// 2.Get all posts with pagination:
postsRouter.get("/:page", async (req, res) => {
  const { page } = req.params;
  const { rows: postsCount } = await db.query("SELECT COUNT(post_id) FROM posts");

  const multiplied = page * 6;
  const offset = multiplied - 6;
  const getAllPagination = {
    text: `SELECT *
          FROM posts
          ORDER BY post_id ASC
          LIMIT 6
          OFFSET $1`,
    values: [offset],
  };

  db.query(getAllPagination)
    .then((data) =>
      res.json({
        count: Number(postsCount[0].count),
        posts: data.rows,
      })
    )
    .catch((error) => res.status(500).send(error.message));
});

// 3.Get one post
postsRouter.get("/post/:id", (req, res) => {
  const { id } = req.params;
  const getOnePost = {
    text: `SELECT *,
            p.slug
           FROM posts p
           LEFT JOIN authors a
            ON p.author_id = a.author_id
            WHERE post_id = $1`,
    values: [id],
  };
  db.query(getOnePost)
    .then((data) => res.json(data.rows))
    .catch((error) => res.status(500).send(error.message));
});

// 4. Get Search:
postsRouter.get("/results/:search", (req, res) => {
  const { search } = req.params;
  const searchParam = `% ${search} %`;

  const getSearched = {
    text: `SELECT *
          FROM posts
          WHERE history LIKE $1;`,
    values: [searchParam],
  };

  db.query(getSearched)
    .then((data) => res.json(data.rows))
    .catch((error) => res.status(500).send(error.message));
});

// 5. Get Category:
postsRouter.get("/categories/:category", (req, res) => {
  const { category } = req.params;

  const getSearched = {
    text: `SELECT *
          FROM posts
          WHERE type = $1;`,
    values: [category],
  };

  db.query(getSearched)
    .then((data) => res.json(data.rows))
    .catch((error) => res.status(500).send(error.message));
});

module.exports = postsRouter;
