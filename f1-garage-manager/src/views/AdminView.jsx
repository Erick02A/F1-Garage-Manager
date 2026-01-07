import { admin } from "../data/mock";

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
    </div>
  );
}
