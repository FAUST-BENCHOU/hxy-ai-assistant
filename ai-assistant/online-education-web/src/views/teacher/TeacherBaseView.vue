<template>
  <div class="teacher">
    <el-container >
      <el-header class="header_div">
        <div class="header_div_left">
          <div class="header_div_avatar">
            <el-avatar style="width: 100%;height: 100%;" :src="require('@/assets/images/teacher/teacher.jpeg')"></el-avatar>
          </div>
          <div class="header_div_info">
            <div>张三</div>
            <div>大学教授</div>
          </div>
        </div>
        <div class="header_div_right">
          <div class="button_div">
            <el-button @click="goHomeView" size="large">返回官网首页</el-button>
          </div>
        </div>
      </el-header>
      <el-container>
        <el-aside width="300px">
          <TeacherAside></TeacherAside>
        </el-aside>
        <el-main>
          <router-view></router-view>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script setup>
import TeacherAside from "@/views/teacher/TeacherAside.vue";
import router from "@/router";

//返回官网首页
const goHomeView = ()=>{
  router.push("/base/home")
}
</script>

<style scoped>
.teacher{
  width: 100%;
  height: auto;
}
el-container{
  width: 100%;
  height: auto;
}

.header_div{
  width: 100%;
  height: auto;
  background-color: #f3cc9c;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.header_div_left{
  width: 80%;
  height: auto;
  background-color: #f3cc9c;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}

.header_div_avatar{
  border: 1px solid blue;
  width: 100px;
  height: 100px;
  border-radius: 50%;
  margin-left: 5%;
}
.header_div_info{
  margin-left: 3%;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.header_div_right{
  width: 20%;
}
</style>