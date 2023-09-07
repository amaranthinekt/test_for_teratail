<template>
  <div class="container">
    <h1 class="#f3e5f5 purple lighten-5 center">[Rails+Vue.js]~Bookshelf~</h1>
    <div class="row #e3f2fd blue lighten-5">
      <div class="col s4 m6" v-for="book in books" :key="book.id">
        <div class="card btn">
          <span class="card-title" @click="setBookInfo(book.id)">
            {{ book.title }}
          </span>
        </div>
      </div>
    </div>
    <div class="row" v-show="bookInfoBool">
      <div class="col s12 m12">
        <div class="card blue-grey darken-1">
          <div class="card-content white-text">
            <span class="card-title">
              【{{ bookInfo.title }}】
            </span>
            <div class="detail">
              ・著者：{{ bookInfo.author }}
            </div>
            <div class="detail">
              ・出版社：{{ bookInfo.publisher }}
            </div>
            <div class="detail">
              ・ジャンル：{{ bookInfo.genre }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import axios from 'axios';

const bookInfo = ref({});
const bookInfoBool = ref(false);
const books = ref([]);

const fetchBooks = () => {
  axios.get('http://localhost:3000/api/books').then(
    (res) => {
      books.value = res.data;
    },
    (error) => {
      console.log(error);
    }
  );
};

const setBookInfo = (id: number) => {
  axios.get(`http://localhost:3000/api/books/${id}.json`).then((res) => {
    bookInfo.value = res.data;
    bookInfoBool.value = true;
  });
};

onMounted(fetchBooks);
</script>

<style scoped></style>
