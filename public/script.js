document.addEventListener('DOMContentLoaded', () => {
    const verMedicosBtn = document.getElementById('verMedicos');
    const verPacientesBtn = document.getElementById('verPacientes');
    const agregarMedicoBtn = document.getElementById('agregarMedico');
    const agregarPacienteBtn = document.getElementById('agregarPaciente');
    const buscarPacientesBtn = document.getElementById('buscarPacientes');

    const listaMedicosDiv = document.getElementById('listaMedicos');
    const listaPacientesDiv = document.getElementById('listaPacientes');
    const formularioMedicoDiv = document.getElementById('formularioMedico');
    const formularioPacienteDiv = document.getElementById('formularioPaciente');

    const medicosTableBody = document.getElementById('medicosTableBody');
    const pacientesTableBody = document.getElementById('pacientesTableBody');
    const provinciaSelect = document.getElementById('provincia_id');

    const medicoForm = document.getElementById('medicoForm');
    const pacienteForm = document.getElementById('pacienteForm');

    // Función para mostrar la lista de médicos
    async function cargarMedicos() {
        try {
            const response = await fetch('/api/medicos');
            const medicos = await response.json();
            medicosTableBody.innerHTML = '';
            medicos.forEach(medico => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>${medico.id}</td>
                    <td>${medico.nombre}</td>
                    <td>${medico.apellido}</td>
                    <td>${medico.especialidad}</td>
                    <td>${medico.provincia}</td>
                    <td>${medico.email}</td>
                    <td>${medico.telefono}</td>
                    <td>${medico.direccion}</td>
                    <td>${medico.ciudad}</td>
                    <td>${medico.dni}</td>
                    <td>${medico.fecha_nacimiento}</td>
                    <td>
                        <button onclick="editarMedico(${medico.id})">Editar</button>
                        <button onclick="eliminarMedico(${medico.id})">Eliminar</button>
                    </td>
                `;
                medicosTableBody.appendChild(tr);
            });
        } catch (err) {
            console.error('Error cargando médicos:', err);
        }
    }

    // Función para mostrar la lista de pacientes
    async function cargarPacientes() {
        try {
            const response = await fetch('/api/pacientes');
            const pacientes = await response.json();
            pacientesTableBody.innerHTML = '';
            pacientes.forEach(paciente => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>${paciente.id}</td>
                    <td>${paciente.nombre}</td>
                    <td>${paciente.apellido}</td>
                    <td>${paciente.email}</td>
                    <td>${paciente.telefono}</td>
                    <td>${paciente.direccion}</td>
                    <td>${paciente.ciudad}</td>
                    <td>${paciente.dni}</td>
                    <td>${paciente.provincia}</td>
                    <td>${paciente.fecha_nacimiento}</td>
                    <td>
                        <button onclick="editarPaciente(${paciente.id})">Editar</button>
                        <button onclick="eliminarPaciente(${paciente.id})">Eliminar</button>
                    </td>
                `;
                pacientesTableBody.appendChild(tr);
            });
        } catch (err) {
            console.error('Error cargando pacientes:', err);
        }
    }

    // Función para cargar provincias en el select
    async function cargarProvincias() {
        try {
            const response = await fetch('/api/provincias');
            const provincias = await response.json();
            provinciaSelect.innerHTML = '<option value="">--Selecciona una Provincia--</option>';
            provincias.forEach(provincia => {
                const option = document.createElement('option');
                option.value = provincia.id;
                option.textContent = provincia.nombre;
                provinciaSelect.appendChild(option);
            });
        } catch (err) {
            console.error('Error cargando provincias:', err);
        }
    }

    // Función para mostrar el formulario de agregar/editar médico
    function mostrarFormularioMedico(medico = {}) {
        formularioMedicoDiv.style.display = 'block';
        listaMedicosDiv.style.display = 'none';
        listaPacientesDiv.style.display = 'none';
        formularioPacienteDiv.style.display = 'none';

        document.getElementById('medicoId').value = medico.id || '';
        document.getElementById('medicoNombre').value = medico.nombre || '';
        document.getElementById('medicoApellido').value = medico.apellido || '';
        document.getElementById('medicoEspecialidad').value = medico.especialidad_id || '';
        document.getElementById('medicoProvincia').value = medico.provincia_id || '';
        document.getElementById('medicoEmail').value = medico.email || '';
        document.getElementById('medicoTelefono').value = medico.telefono || '';
        document.getElementById('medicoDireccion').value = medico.direccion || '';
        document.getElementById('medicoCiudad').value = medico.ciudad || '';
        document.getElementById('medicoDni').value = medico.dni || '';
        document.getElementById('medicoFechaNacimiento').value = medico.fecha_nacimiento || '';
    }

    // Función para mostrar el formulario de agregar/editar paciente
    function mostrarFormularioPaciente(paciente = {}) {
        formularioPacienteDiv.style.display = 'block';
        listaMedicosDiv.style.display = 'none';
        listaPacientesDiv.style.display = 'none';
        formularioMedicoDiv.style.display = 'none';

        document.getElementById('pacienteId').value = paciente.id || '';
        document.getElementById('pacienteNombre').value = paciente.nombre || '';
        document.getElementById('pacienteApellido').value = paciente.apellido || '';
        document.getElementById('pacienteProvincia').value = paciente.provincia_id || '';
        document.getElementById('pacienteEmail').value = paciente.email || '';
        document.getElementById('pacienteTelefono').value = paciente.telefono || '';
        document.getElementById('pacienteDireccion').value = paciente.direccion || '';
        document.getElementById('pacienteCiudad').value = paciente.ciudad || '';
        document.getElementById('pacienteDni').value = paciente.dni || '';
        document.getElementById('pacienteFechaNacimiento').value = paciente.fecha_nacimiento || '';
    }

    // Evento para ver la lista de médicos
    verMedicosBtn.addEventListener('click', () => {
        listaMedicosDiv.style.display = 'block';
        listaPacientesDiv.style.display = 'none';
        formularioMedicoDiv.style.display = 'none';
        formularioPacienteDiv.style.display = 'none';
        cargarMedicos();
    });

    // Evento para ver la lista de pacientes
    verPacientesBtn.addEventListener('click', () => {
        listaPacientesDiv.style.display = 'block';
        listaMedicosDiv.style.display = 'none';
        formularioMedicoDiv.style.display = 'none';
        formularioPacienteDiv.style.display = 'none';
        cargarPacientes();
    });

    // Evento para mostrar el formulario de agregar médico
    agregarMedicoBtn.addEventListener('click', () => {
        mostrarFormularioMedico();
    });

    // Evento para mostrar el formulario de agregar paciente
    agregarPacienteBtn.addEventListener('click', () => {
        mostrarFormularioPaciente();
    });

    // Evento para buscar pacientes por provincia
    buscarPacientesBtn.addEventListener('click', async () => {
        const provinciaId = provinciaSelect.value;
        if (provinciaId) {
            try {
                const response = await fetch(`/api/pacientes/provincia/${provinciaId}`);
                const pacientes = await response.json();
                pacientesTableBody.innerHTML = '';
                pacientes.forEach(paciente => {
                    const tr = document.createElement('tr');
                    tr.innerHTML = `
                        <td>${paciente.id}</td>
                        <td>${paciente.nombre}</td>
                        <td>${paciente.apellido}</td>
                        <td>${paciente.email}</td>
                        <td>${paciente.telefono}</td>
                        <td>${paciente.direccion}</td>
                        <td>${paciente.ciudad}</td>
                        <td>${paciente.dni}</td>
                        <td>${paciente.provincia}</td>
                        <td>${paciente.fecha_nacimiento}</td>
                        <td>
                            <button onclick="editarPaciente(${paciente.id})">Editar</button>
                            <button onclick="eliminarPaciente(${paciente.id})">Eliminar</button>
                        </td>
                    `;
                    pacientesTableBody.appendChild(tr);
                });
            } catch (err) {
                console.error('Error cargando pacientes:', err);
            }
        }
    });

    // Función para editar un médico
    window.editarMedico = async function(id) {
        try {
            const response = await fetch(`/api/medicos/${id}`);
            const medico = await response.json();
            mostrarFormularioMedico(medico);
        } catch (err) {
            console.error('Error cargando médico:', err);
        }
    };

    // Función para editar un paciente
    window.editarPaciente = async function(id) {
        try {
            const response = await fetch(`/api/pacientes/${id}`);
            const paciente = await response.json();
            mostrarFormularioPaciente(paciente);
        } catch (err) {
            console.error('Error cargando paciente:', err);
        }
    };

    // Función para eliminar un médico
    window.eliminarMedico = async function(id) {
        try {
            await fetch(`/api/medicos/${id}`, { method: 'DELETE' });
            cargarMedicos();
        } catch (err) {
            console.error('Error eliminando médico:', err);
        }
    };

    // Función para eliminar un paciente
    window.eliminarPaciente = async function(id) {
        try {
            await fetch(`/api/pacientes/${id}`, { method: 'DELETE' });
            cargarPacientes();
        } catch (err) {
            console.error('Error eliminando paciente:', err);
        }
    };

    // Evento para enviar el formulario de médico
    medicoForm.addEventListener('submit', async (e) => {
        e.preventDefault();
        const id = document.getElementById('medicoId').value;
        const medico = {
            nombre: document.getElementById('medicoNombre').value,
            apellido: document.getElementById('medicoApellido').value,
            especialidad_id: document.getElementById('medicoEspecialidad').value,
            provincia_id: document.getElementById('medicoProvincia').value,
            email: document.getElementById('medicoEmail').value,
            telefono: document.getElementById('medicoTelefono').value,
            direccion: document.getElementById('medicoDireccion').value,
            ciudad: document.getElementById('medicoCiudad').value,
            dni: document.getElementById('medicoDni').value,
            fecha_nacimiento: document.getElementById('medicoFechaNacimiento').value,
        };
        try {
            if (id) {
                await fetch(`/api/medicos/${id}`, {
                    method: 'PUT',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(medico),
                });
            } else {
                await fetch('/api/medicos', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(medico),
                });
            }
            formularioMedicoDiv.style.display = 'none';
            cargarMedicos();
        } catch (err) {
            console.error('Error guardando médico:', err);
        }
    });

    // Evento para enviar el formulario de paciente
    pacienteForm.addEventListener('submit', async (e) => {
        e.preventDefault();
        const id = document.getElementById('pacienteId').value;
        const paciente = {
            nombre: document.getElementById('pacienteNombre').value,
            apellido: document.getElementById('pacienteApellido').value,
            provincia_id: document.getElementById('pacienteProvincia').value,
            email: document.getElementById('pacienteEmail').value,
            telefono: document.getElementById('pacienteTelefono').value,
            direccion: document.getElementById('pacienteDireccion').value,
            ciudad: document.getElementById('pacienteCiudad').value,
            dni: document.getElementById('pacienteDni').value,
            fecha_nacimiento: document.getElementById('pacienteFechaNacimiento').value,
        };
        try {
            if (id) {
                await fetch(`/api/pacientes/${id}`, {
                    method: 'PUT',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(paciente),
                });
            } else {
                await fetch('/api/pacientes', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(paciente),
                });
            }
            formularioPacienteDiv.style.display = 'none';
            cargarPacientes();
        } catch (err) {
            console.error('Error guardando paciente:', err);
        }
    });

    // Inicializar la página
    cargarProvincias();
});
