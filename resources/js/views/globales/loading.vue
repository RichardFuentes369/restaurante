<template>
  <div class="position">
    <div class="preloader" />
  </div>
</template>
<style>
.position {
  position: absolute;
  margin-left: 47%;
  margin-right: 50%;
  margin-top: 18rem !important;
}
.preloader {
  width: 70px;
  height: 70px;
  /* border: 10px solid #eee; */
  border-top: 10px solid #666;
  border-radius: 50%;
  /* -webkit-animation-name: girar; */
  animation-name: girar;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-iteration-count: infinite;
  animation-iteration-count: infinite;
  -webkit-animation-timing-function: linear;
  animation-timing-function: linear;
}
@keyframes girar {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
</style>
<script>
export default {

};
</script>