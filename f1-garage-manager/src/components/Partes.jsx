import { partes } from "../data/partes";

export default function Partes() {
  return (
    <div>
      <h2>Catálogo de Partes</h2>
      <table>
        <thead>
          <tr>
            <th>Categoría</th>
            <th>P</th>
            <th>A</th>
            <th>M</th>
          </tr>
        </thead>
        <tbody>
          {partes.map(p => (
            <tr key={p.id}>
              <td>{p.categoria}</td>
              <td>{p.p}</td>
              <td>{p.a}</td>
              <td>{p.m}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
