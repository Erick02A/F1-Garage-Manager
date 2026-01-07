import { admin } from "../data/mock";
const equipos = [
  {
    nombre: "Red Apex",
    miembros: [
      { nombre: "Carlos", rol: "Engineer" },
      { nombre: "Ana", rol: "Driver" }
    ]
  },
  {
    nombre: "Blue Velocity",
    miembros: [
      { nombre: "Luis", rol: "Engineer" },
      { nombre: "María", rol: "Driver" }
    ]
  }
];

export default function AdminView() {
  return (
    <div>
      <h2>Vista Admin</h2>
            <h3>Simulaciones</h3>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Circuito</th>
            <th>Ganador</th>
          </tr>
        </thead>
        <tbody>
          {admin.simulaciones.map(s => (
            <tr key={s.id}>
              <td>{s.id}</td>
              <td>{s.circuito}</td>
              <td>{s.ganador}</td>
            </tr>
          ))}
        </tbody>
      </table>

      {equipos.map((e, i) => (
        <div key={i} style={{ marginBottom: "15px" }}>
          <h3>{e.nombre}</h3>
          <ul>
            {e.miembros.map((m, j) => (
              <li key={j}>
                {m.nombre} – {m.rol}
              </li>
            ))}
          </ul>
        </div>
      ))}
    </div>
  );


}
