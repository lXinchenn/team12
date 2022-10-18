<template>
  <el-row :gutter="20" style="padding-top: 30vh">
    <el-col :span="8" :offset="4">
      <h2>Major selection</h2>
      <!--      MAJOR SELECT-->
      <el-checkbox-group
        v-model="checkedCourse"
        :max="2">
        <el-checkbox
          @change="action"
          v-for="course in courses"
          :label="course.major"
          :key="course.major"
          style="padding-bottom: 0.5vh">{{ course.major }}
        </el-checkbox>
      </el-checkbox-group>
      <!--      MAJOR SELECT-->
    </el-col>

    <el-col :span="8">
      <h2>Path selection</h2>
      <!--      DIRECTION SELECT-->
      <el-checkbox-group v-model="checkedDirection" :max="2">
        <el-checkbox
          v-for="direction in directions"
          :label="direction"
          :key="direction"
          style="padding-bottom: 1vh">{{ direction }}
        </el-checkbox>
      </el-checkbox-group>
      <!--      DIRECTION SELECT-->
    </el-col>
    <el-col :offset="18" :span="2">
      <el-button type="success" size="medium" @click="open">Submit</el-button>
    </el-col>
  </el-row>
</template>

<script>
export default {
  name: "choice",
  data() {
    return {
      courses: '',
      checkedCourse: [],
      checkedDirection: [],
      directions: '',
    }
  },
  created() {
    this.test()
  },
  methods: {
    // 选取专业触发事件
    action() {
      this.$axios.post(`${this.$settings.HOST}/course/direction/`, {
        info: this.checkedCourse
      }).then(response => {
        this.directions = response.data
      }).catch(error => {
        console.log(error.response.data)
      });
    },
    // 在提交选择前判断是否选了专业与方向
    open() {
      if (this.checkedDirection === '') {
        this.$message.error('Please choose your Path');
        return false;
      } else if (this.checkedCourse.length === 0) {
        this.$message.error('Please choose your Major');
        return false;
      }
      this.$msgbox({
        title: 'message',
        message: "major choice: " +
          this.checkedCourse +
          ", path choice: " +
          this.checkedDirection +
          ", Are you sure?",
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
        beforeClose: (action, instance, done) => {
          if (action === 'confirm') {
            instance.confirmButtonLoading = true;
            instance.confirmButtonText = 'submit...';
            setTimeout(() => {
              done();
              setTimeout(() => {
                instance.confirmButtonLoading = false;
              }, 300);
            }, 1000);
          } else {
            done();
          }
        }
      }).then(action => {
        this.$router.push('/home');
        sessionStorage.major = this.checkedCourse;
        sessionStorage.direction = this.checkedDirection;
      });
    },
    test() {
      this.$axios.get(`${this.$settings.HOST}/course/major/`).then(response => {
        this.courses = response.data
      }).catch(error => {
        console.log(error.response.data)
      });
    }
  }
}
</script>

<style scoped>

</style>
