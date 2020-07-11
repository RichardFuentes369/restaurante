<template>
  <div>
    <div class="col-sm-12 row">
      <h3>Noticias</h3>
    </div>
    <div 
      v-for="(noticia, key) in noticias"
      :key="key"
      class="card mt-2"
    >
      <div class="card-body">
        <h5 class="card-title">
          {{ noticia.titulo }}
        </h5>
        <h6 class="card-subtitle mb-2 text-muted">
          {{ noticia.subtitulo }}
        </h6>
        <p class="card-text">
          {{ noticia.contenido }}
        </p>
        <a 
          href="#" 
          class="card-link"
        >
          Ver link
        </a>
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
      noticias: [
      {
        'titulo': 'Noticia numero 1',
        'subtitulo': 'Subtitulo numero 1',
        'contenido': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus numquam, inventore nisi minus eius ullam culpa, tenetur debitis sit quas obcaecati natus tempore rerum quae labore quasi hic. Eveniet, tenetur.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, quasi debitis molestiae nobis at quas nam cupiditate eligendi, dolorem ad dignissimos eos praesentium sit nostrum, aliquid autem animi laudantium illo.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis obcaecati vitae totam possimus optio, debitis maiores illo repellendus numquam! Dignissimos dolorum sapiente dicta quasi molestiae nobis veritatis, doloremque, architecto consequatur?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime aut nulla dolor nesciunt exercitationem eligendi maiores perferendis esse, deserunt tempora quisquam. Iure alias molestias consectetur nemo ducimus at harum officiis.'
      },
      {
        'titulo': 'Noticia numero 1',
        'subtitulo': 'Subtitulo numero 1',
        'contenido': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque hic delectus qui cum velit unde, expedita animi officiis fugiat, facilis quod iste recusandae, ratione ipsum ab? Consequuntur at, modi facere!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae expedita sint, consectetur, quas hic id illum est. Consequatur perferendis dolorem, qui deserunt, magnam aperiam temporibus dicta expedita nobis enim libero.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio aspernatur modi provident quis doloremque non laboriosam, dolor saepe adipisci nisi alias unde possimus eius! Dignissimos itaque, blanditiis natus repellat dicta.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates rerum illo ex earum nulla aliquid, officia esse iure, incidunt expedita praesentium quod natus rem sapiente id, ipsum beatae sequi cupiditate.'
      },
      {
        'titulo': 'Noticia numero 1',
        'subtitulo': 'Subtitulo numero 1',
        'contenido': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis vel consequatur amet atque? Fugit tenetur, assumenda magnam itaque quod, possimus debitis praesentium porro culpa, ex, ipsam eligendi. Voluptatibus, veniam, ex.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci nulla saepe in illo error et quas maiores soluta vel animi, harum, officiis optio architecto. Voluptatem facere commodi, sint iure. Quae?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo non rem accusantium amet. Excepturi sint voluptatum fugit accusamus, incidunt vel esse animi perferendis itaque nihil quibusdam molestias dolorem illo et.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione pariatur fugiat quis blanditiis id error earum aliquam, hic impedit, omnis facere eius numquam asperiores, voluptates odit fuga saepe deserunt maiores.'
      },        {
        'titulo': 'Noticia numero 1',
        'subtitulo': 'Subtitulo numero 1',
        'contenido': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus numquam, inventore nisi minus eius ullam culpa, tenetur debitis sit quas obcaecati natus tempore rerum quae labore quasi hic. Eveniet, tenetur.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, quasi debitis molestiae nobis at quas nam cupiditate eligendi, dolorem ad dignissimos eos praesentium sit nostrum, aliquid autem animi laudantium illo.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis obcaecati vitae totam possimus optio, debitis maiores illo repellendus numquam! Dignissimos dolorum sapiente dicta quasi molestiae nobis veritatis, doloremque, architecto consequatur?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime aut nulla dolor nesciunt exercitationem eligendi maiores perferendis esse, deserunt tempora quisquam. Iure alias molestias consectetur nemo ducimus at harum officiis.'
      },
      {
        'titulo': 'Noticia numero 1',
        'subtitulo': 'Subtitulo numero 1',
        'contenido': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque hic delectus qui cum velit unde, expedita animi officiis fugiat, facilis quod iste recusandae, ratione ipsum ab? Consequuntur at, modi facere!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae expedita sint, consectetur, quas hic id illum est. Consequatur perferendis dolorem, qui deserunt, magnam aperiam temporibus dicta expedita nobis enim libero.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio aspernatur modi provident quis doloremque non laboriosam, dolor saepe adipisci nisi alias unde possimus eius! Dignissimos itaque, blanditiis natus repellat dicta.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates rerum illo ex earum nulla aliquid, officia esse iure, incidunt expedita praesentium quod natus rem sapiente id, ipsum beatae sequi cupiditate.'
      },
      {
        'titulo': 'Noticia numero 1',
        'subtitulo': 'Subtitulo numero 1',
        'contenido': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis vel consequatur amet atque? Fugit tenetur, assumenda magnam itaque quod, possimus debitis praesentium porro culpa, ex, ipsam eligendi. Voluptatibus, veniam, ex.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci nulla saepe in illo error et quas maiores soluta vel animi, harum, officiis optio architecto. Voluptatem facere commodi, sint iure. Quae?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo non rem accusantium amet. Excepturi sint voluptatum fugit accusamus, incidunt vel esse animi perferendis itaque nihil quibusdam molestias dolorem illo et.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione pariatur fugiat quis blanditiis id error earum aliquam, hic impedit, omnis facere eius numquam asperiores, voluptates odit fuga saepe deserunt maiores.'
      },        {
        'titulo': 'Noticia numero 1',
        'subtitulo': 'Subtitulo numero 1',
        'contenido': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus numquam, inventore nisi minus eius ullam culpa, tenetur debitis sit quas obcaecati natus tempore rerum quae labore quasi hic. Eveniet, tenetur.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, quasi debitis molestiae nobis at quas nam cupiditate eligendi, dolorem ad dignissimos eos praesentium sit nostrum, aliquid autem animi laudantium illo.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis obcaecati vitae totam possimus optio, debitis maiores illo repellendus numquam! Dignissimos dolorum sapiente dicta quasi molestiae nobis veritatis, doloremque, architecto consequatur?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime aut nulla dolor nesciunt exercitationem eligendi maiores perferendis esse, deserunt tempora quisquam. Iure alias molestias consectetur nemo ducimus at harum officiis.'
      },
      {
        'titulo': 'Noticia numero 1',
        'subtitulo': 'Subtitulo numero 1',
        'contenido': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque hic delectus qui cum velit unde, expedita animi officiis fugiat, facilis quod iste recusandae, ratione ipsum ab? Consequuntur at, modi facere!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae expedita sint, consectetur, quas hic id illum est. Consequatur perferendis dolorem, qui deserunt, magnam aperiam temporibus dicta expedita nobis enim libero.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio aspernatur modi provident quis doloremque non laboriosam, dolor saepe adipisci nisi alias unde possimus eius! Dignissimos itaque, blanditiis natus repellat dicta.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates rerum illo ex earum nulla aliquid, officia esse iure, incidunt expedita praesentium quod natus rem sapiente id, ipsum beatae sequi cupiditate.'
      },
      {
        'titulo': 'Noticia numero 1',
        'subtitulo': 'Subtitulo numero 1',
        'contenido': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis vel consequatur amet atque? Fugit tenetur, assumenda magnam itaque quod, possimus debitis praesentium porro culpa, ex, ipsam eligendi. Voluptatibus, veniam, ex.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci nulla saepe in illo error et quas maiores soluta vel animi, harum, officiis optio architecto. Voluptatem facere commodi, sint iure. Quae?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo non rem accusantium amet. Excepturi sint voluptatum fugit accusamus, incidunt vel esse animi perferendis itaque nihil quibusdam molestias dolorem illo et.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione pariatur fugiat quis blanditiis id error earum aliquam, hic impedit, omnis facere eius numquam asperiores, voluptates odit fuga saepe deserunt maiores.'
      },        {
        'titulo': 'Noticia numero 1',
        'subtitulo': 'Subtitulo numero 1',
        'contenido': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus numquam, inventore nisi minus eius ullam culpa, tenetur debitis sit quas obcaecati natus tempore rerum quae labore quasi hic. Eveniet, tenetur.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam, quasi debitis molestiae nobis at quas nam cupiditate eligendi, dolorem ad dignissimos eos praesentium sit nostrum, aliquid autem animi laudantium illo.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis obcaecati vitae totam possimus optio, debitis maiores illo repellendus numquam! Dignissimos dolorum sapiente dicta quasi molestiae nobis veritatis, doloremque, architecto consequatur?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime aut nulla dolor nesciunt exercitationem eligendi maiores perferendis esse, deserunt tempora quisquam. Iure alias molestias consectetur nemo ducimus at harum officiis.'
      },
      {
        'titulo': 'Noticia numero 1',
        'subtitulo': 'Subtitulo numero 1',
        'contenido': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque hic delectus qui cum velit unde, expedita animi officiis fugiat, facilis quod iste recusandae, ratione ipsum ab? Consequuntur at, modi facere!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae expedita sint, consectetur, quas hic id illum est. Consequatur perferendis dolorem, qui deserunt, magnam aperiam temporibus dicta expedita nobis enim libero.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio aspernatur modi provident quis doloremque non laboriosam, dolor saepe adipisci nisi alias unde possimus eius! Dignissimos itaque, blanditiis natus repellat dicta.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates rerum illo ex earum nulla aliquid, officia esse iure, incidunt expedita praesentium quod natus rem sapiente id, ipsum beatae sequi cupiditate.'
      },
      {
        'titulo': 'Noticia numero 1',
        'subtitulo': 'Subtitulo numero 1',
        'contenido': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis vel consequatur amet atque? Fugit tenetur, assumenda magnam itaque quod, possimus debitis praesentium porro culpa, ex, ipsam eligendi. Voluptatibus, veniam, ex.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci nulla saepe in illo error et quas maiores soluta vel animi, harum, officiis optio architecto. Voluptatem facere commodi, sint iure. Quae?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo non rem accusantium amet. Excepturi sint voluptatum fugit accusamus, incidunt vel esse animi perferendis itaque nihil quibusdam molestias dolorem illo et.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione pariatur fugiat quis blanditiis id error earum aliquam, hic impedit, omnis facere eius numquam asperiores, voluptates odit fuga saepe deserunt maiores.'
      },
      ]
    };
  },
  methods: {
    ocultarmostrar() {
      if (this.isCollapse) {
        this.isCollapse = false
        this.icon = 'el-icon-caret-left'
      } else {
        this.isCollapse = true
        this.icon = 'el-icon-caret-right'
      }
    },
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    }
  }
};
</script>