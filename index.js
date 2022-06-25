require("dotenv").config();
const express = require("express");
const app = express();
app.use(express.json());
const PORT = process.env.PORT || 3000;

const postsRouter = require("./routes/postsRouter");
app.use("/api/posts", postsRouter);

const authorsRouter = require("./routes/authorsRouter");
app.use("/api/authors", authorsRouter);

const booksRouter = require("./routes/booksRouter");
app.use("/api/books", booksRouter);

app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});
