import { usuarios } from "../data/usuarios";

export default function Usuarios() {
  return (
    <div>
      <h2>Usuarios</h2>
      <table>
        <thead>
          <tr>
            <th>Correo</th>
            <th>Nombre</th>
            <th>Rol</th>
            <th>Equipo</th>
          </tr>
        </thead>
        <tbody>
          {usuarios.map(u => (
            <tr key={u.correo}>
              <td>{u.correo}</td>
              <td>{u.nombre}</td>
              <td>{u.rol}</td>
              <td>{u.equipo}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
