import { inventario } from "../data/inventario";

export default function Inventario() {
  return (
    <div>
      <h2>Inventario del Equipo</h2>
      <table>
        <thead>
          <tr>
            <th>Equipo</th>
            <th>Categoría</th>
            <th>Cantidad</th>
          </tr>
        </thead>
        <tbody>
          {inventario.map((i, idx) => (
            <tr key={idx}>
              <td>{i.equipo}</td>
              <td>{i.categoria}</td>
              <td>{i.cantidad}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
