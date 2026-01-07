export default function Navbar({ setVista }) {
  return (
    <div style={{ marginBottom: "20px" }}>
      <button onClick={() => setVista("engineer")}>Engineer</button>
      <button onClick={() => setVista("driver")}>Driver</button>
      <button onClick={() => setVista("admin")}>Admin</button>
    </div>
  );
}
