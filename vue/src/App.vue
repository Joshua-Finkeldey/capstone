<template>
  <div id="app">
    <div id="empContainer" v-if='Object.keys($store.state.user).length !== 0'>
    <div class='top'>
      <router-link v-bind:to="{ name: 'login' }" v-if='Object.keys($store.state.user).length === 0'>Login</router-link>
      <div v-if='Object.keys($store.state.user).length !== 0' >
        {{$store.state.user.username}}&nbsp;|&nbsp;
        <router-link v-bind:to="{ name: 'logout' }">Logout</router-link>
      </div>
      <h1>BRB PIZZA</h1>
      <p>Tech Elevator</p>
    </div>
    
    <boards-list class='boardsList'/>
    <router-view :key="$route.fullPath" class="routerView"/>
    
    </div>
    <router-view v-if='Object.keys($store.state.user).length === 0' />
  </div>
</template>
<script>

import BoardsList from '@/components/BoardsList';

export default {
  components: {
    BoardsList
  },
  name: "app"
}
</script>

<style>

#empContainer {
  display: grid;
  grid-template-rows: 40px calc(100vh - 40px);
  grid-template-columns: 1fr 3fr;
  grid-template-areas:
    'boards header'
    'boards content';
}

.boardsList{
  grid-area: boards;
}

.top{
  background-color: lightseagreen;
  display: flex;
  align-items: center;
  justify-content: space-around;
  grid-area: header;
}
/* body {
    background-color: #B7D8BD;
    font-family:'Major Mono Display', monospace;
    
} */
/* .logoFont {
    font-family: 'Slackey',cursive;

} */
/* #app {
  font-family:'Major Mono Display', monospace;
  display:flex;
  min-height: 100vh;
  flex-direction: column;
} */
</style>
