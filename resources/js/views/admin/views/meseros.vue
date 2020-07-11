<template>
  <div class="contenido">
    <div class="row">
      <h2 class="title mb-3">
        Meseros
      </h2> 
      <button 
        type="button" 
        class="btn btn-success btnadd ml-3 mt-1" 
        data-toggle="modal" 
        data-target=".bd-example-modal-xl" 
        circle
      >
        <i class="fa fa-plus" />
      </button>
    </div>
    <div class="justify-content-center table-responsive">
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">
              #
            </th>
            <th scope="col">
              First
            </th>
            <th scope="col">
              Last
            </th>
            <th scope="col">
              Handle
            </th>                 
            <th scope="col">
              First
            </th>
            <th scope="col">
              Last
            </th>
            <th scope="col">
              Handle
            </th>             
            <th scope="col">
              First
            </th>
            <th scope="col">
              Last
            </th>
            <th scope="col">
              Handle
            </th>
          </tr>
        </thead>
        <tbody>
          <tr 
            v-for="(restaurante, key) in restaurantes"
            :key="key"
          >
            <th scope="row">
              1
            </th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Modal -->
    <div 
      class="modal fade bd-example-modal-xl" 
      tabindex="-1" 
      role="dialog" 
      aria-labelledby="myExtraLargeModalLabel" 
      aria-hidden="true"
    >
      <div 
        class="modal-dialog modal-xl" 
        role="document"
      >
        <div class="modal-content">
          <div class="modal-content">
            <div class="modal-header">
              <h5 
                id="exampleModalLabel"
                class="modal-title"
              >
                Añadir Restaurante
              </h5>
              <button 
                type="button" 
                class="close" 
                data-dismiss="modal" 
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <!-- <div class="modal-body contenido" :style="`height: ${this.alto}px; width: 100%; overflow-y: auto; overflow-x: hidden;`"> -->
              <label for="">Nombres</label>
              <input 
                type="text" 
                class="form-control"
              >
              <label for="">Apellidos</label>
              <input 
                type="text" 
                class="form-control"
              >
              <label for="">Genero</label>
              <select 
                id=""
                name="" 
                class="form-control"
              >
                <option value="">
                  --Seleccione--
                </option>
                <option value="">
                  Masculino
                </option>
                <option value="">
                  Femenino
                </option>
              </select>
              <label for="">Dirección</label>
              <input 
                type="text" 
                class="form-control"
              >
              <label for="">Telecono</label>
              <input 
                type="text" 
                class="form-control"
              >
              <label for="">Celular</label>
              <input 
                type="text" 
                class="form-control"
              >
              <label for="">Correo electronico</label>
              <input 
                type="text" 
                class="form-control"
              >
              <label for="">Fecha de nacimiento</label>
              <input 
                type="text" 
                class="form-control"
              >
            </div>
            <div class="modal-footer">
              <button 
                type="button" 
                class="btn btn-secondary" 
                data-dismiss="modal"
              >
                Close
              </button>
              <button 
                type="button" 
                class="btn btn-primary"
              >
                Save changes
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
  <script>
  import { funciones } from '../../../functions/funciones_principales'
  export default {
    mixins: [funciones],
    data() {
      return {
        restaurantes: [
        {
          'nombre': 'restaurante dona a',
          'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
          'imagen': '',
        },
        {
          'nombre': 'restaurante dona b',
          'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
          'imagen': '',
        },
        {
          'nombre': 'restaurante dona c',
          'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
          'imagen': '',
        },
        {
          'nombre': 'restaurante dona d',
          'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
          'imagen': '',
        },
        {
          'nombre': 'restaurante dona e',
          'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
          'imagen': '',
        },
        {
          'nombre': 'restaurante dona f',
          'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
          'imagen': '',
        },
        {
          'nombre': 'restaurante dona g',
          'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
          'imagen': '',
        },
        {
          'nombre': 'restaurante dona h',
          'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
          'imagen': '',
        },
        {
          'nombre': 'restaurante dona i',
          'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
          'imagen': '',
        },
        {
          'nombre': 'restaurante dona j',
          'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
          'imagen': '',
        },
        {
          'nombre': 'restaurante dona k',
          'descripcion': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, recusandae similique eveniet quis. Quibusdam mollitia fugit officiis repellat, vel voluptates eaque possimus, nostrum dolore quaerat error modi soluta, perferendis! Molestiae.',
          'imagen': '',
        },
        ]
      };
    },
    mounted() {
    },
    methods: {
    }
  };
  </script>
  <style>

  </style>