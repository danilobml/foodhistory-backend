require("dotenv").config();
const cors = require("cors");
const express = require("express");
const morgan = require("morgan");
const helmet = require("helmet");
const app = express();
app.use(express.json());
app.use(cors());
app.use(express.static("assets"));
const PORT = process.env.PORT || 3000;

app.use(morgan("dev"));
app.use(helmet());

const postsRouter = require("./routes/postsRouter");
app.use("/api/posts", postsRouter);

const authorsRouter = require("./routes/authorsRouter");
app.use("/api/authors", authorsRouter);

const booksRouter = require("./routes/booksRouter");
app.use("/api/books", booksRouter);

app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});
