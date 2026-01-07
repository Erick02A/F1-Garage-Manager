import { driver } from "../data/mock";

export default function DriverView() {
  return (
    <div>
      <h2>Vista Driver</h2>
      <p><strong>Nombre:</strong> {driver.nombre}</p>
      <p><strong>Habilidad:</strong> {driver.habilidad}</p>

      <h3>Resultados</h3>
      <table>
        <thead>
          <tr>
            <th>Circuito</th>
            <th>Posición</th>
          </tr>
        </thead>
        <tbody>
          {driver.resultados.map((r, i) => (
            <tr key={i}>
              <td>{r.circuito}</td>
              <td>{r.posicion}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
