<template>
  <div id="login">
    <div class="loginBox">
      <div class="title">
        <span>Login</span>
      </div>
      <div class="Box">
        <div class="Input">
          <el-input v-model="log.username" placeholder="Please enter the account number" clearable></el-input>
          <el-input v-model="log.password" placeholder="Please input a password" show-password></el-input>
        </div>
        <div class="btn">
          <el-button type="primary" @click="Login">Login</el-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "login",
  data() {
    return {
      log: {
        username: '',
        password: '',
      },
    }
  },
  methods: {
    Login() {
      // 在向后台发送登录前先判断用户是否输入了账号密码
      if (this.log.password === '' || this.log.username === '') {
        this.$message.error('Account number or password cannot be empty');
        return false;
      }
      this.$axios.post(`${this.$settings.HOST}/user/login/`, {
        username: this.log.username,
        password: this.log.password,
      }).then(response => {
        // 将用户的id和用户名保存在浏览器缓存，方便其他页面调用
        sessionStorage.user_id = response.data.data.id;
        sessionStorage.user_name = response.data.data.username;
        // 定义弹窗
        let self = this;
        this.$alert('Login succeeded', 'Course selection system', {
          callback() {
            self.$router.push('/choice');
          }
        });
      }).catch(error => {
        console.log(error.response.data);
        this.$message.error('Account password error');
      });
    }
  }
}
</script>

<style scoped>
.loginBox {
  margin: 8% 38%;
  width: 24%;
  min-height: 30vh;
  border-radius: 8px;
  background-color: rgba(255, 255, 255, 0.4);
  backdrop-filter: blur(10px) saturate(200%);
}

.loginBox a {
  padding-top: 20px;
  padding-right: 15px;
  float: right;
  text-decoration: none;
  color: rgb(6, 6, 162);
}

.loginBox a:hover {
  color: white;
}

.loginBox .title {
  text-align: center;
  padding: 10px;
  border-bottom: 1px solid darkblue;
}

.loginBox .title span {
  font-size: 20px;
  color: rgba(37, 37, 115, 0.51);
  cursor: pointer;
  padding: 0 20px;
  border: rgba(255, 255, 255, 0) solid 1px;
  transition-property: all;
  transition-duration: 0.8s;
}

.loginBox .title span:hover {
  color: white;
  border: white solid 1px;
  padding: 0 10px;
  border-radius: 8px;
}

.Box {
  padding: 20px;
}

.Box .btn {
  text-align: center;
}

.Box .el-button {
  border-radius: 8px;
  padding: 12px 126px;
}

.Box .Input {
  padding: 15px 20px;
}

.Box .Input .el-input {
  padding: 20px 0;
}

</style>
