require("dotenv").config();

const express = require("express");
const cors = require("cors");
const medicosRoutes = require("./routes/medicosRoutes");
const pacientesRoutes = require("./routes/pacientesRoutes");
const provinciasRoutes = require("./routes/provinciasRoutes");

const app = express();
const PORT = process.env.PORT || 3001;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use("/api/medicos", medicosRoutes);
app.use("/api/pacientes", pacientesRoutes);
app.use("/api/provincias", provinciasRoutes);

app.use("/auth", require("./routes/auth.router"));

app.use(express.static("public"));

app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
