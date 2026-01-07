import { useState } from "react";
import Navbar from "./components/Navbar";
import EngineerView from "./views/EngineerView";
import DriverView from "./views/DriverView";
import AdminView from "./views/AdminView";

function App() {
  const [vista, setVista] = useState("engineer");

  return (
    <div>
      <h1>F1 Garage Manager</h1>

      <Navbar setVista={setVista} />

      {vista === "engineer" && <EngineerView />}
      {vista === "driver" && <DriverView />}
      {vista === "admin" && <AdminView />}
    </div>
  );
}

export default App;
