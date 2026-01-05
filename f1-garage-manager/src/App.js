import Usuarios from "./components/Usuarios";
import Equipos from "./components/Equipos";
import Partes from "./components/Partes";
import Inventario from "./components/Inventario";
import ArmadoCarro from "./components/ArmadoCarro";

function App() {
  return (
    <div>
      <h1>F1 Garage Manager</h1>
      <Usuarios />
      <Equipos />
      <Partes />
      <Inventario />
      <ArmadoCarro />
    </div>
  );
}

export default App;
