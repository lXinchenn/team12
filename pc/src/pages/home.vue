<template>
  <div id="home">
    <!--    HEADER-->
    <div class="nav">
      <el-image
        style="width: 17vw; height: 12vh; display: inline-block"
        src="/static/logo.png"
        fit="fill"></el-image>
      <h1 style="display: inline-block; vertical-align: top; color: white">Course selection system</h1>
    </div>
    <!--    HEADER-->

    <!--    MAIN-->
    <el-row :gutter="20">d
      <!--      COURSE-->
      <el-col :span="17" style="height:85vh; padding-top: 2vh; padding-left: 2vw">
        <!--        COURSE TYPE SELECT-->
        <el-radio-group v-model="radio" size="mini">
          <el-radio-button label="Compulsory"></el-radio-button>
          <el-radio-button label="Elective"></el-radio-button>
        </el-radio-group>
        <!--        COURSE TYPE SELECT-->

        <!--        COMPULSORY COURSE-->
        <el-table
          v-show="radio==='Compulsory'"
          ref="multipleTable"
          :data="tableData"
          height="calc(100% - 29vh)"
          tooltip-effect="dark"
          style="width: 100%"
          @selection-change="handleSelectionChange">
          <el-table-column
            type="selection"
            width="55"
            :selectable="selectInit">
          </el-table-column>
          <el-table-column
            sortable
            prop="course_id"
            label="course_id"
            width="140">
          </el-table-column>
          <el-table-column
            prop="course_name"
            label="course_name"
            width="300">
          </el-table-column>
          <el-table-column
            prop="Prerequisite"
            label="Prerequisite">
          </el-table-column>
          <el-table-column
            prop="Restriction"
            label="Restriction"
            width="190"
            show-overflow-tooltip>
          </el-table-column>
        </el-table>
        <!--        COMPULSORY COURSE-->

        <!--        ELECTIVE COURSE-->
        <el-table
          v-show="radio==='Elective'"
          ref="multipleTable"
          :data="tableData1"
          height="calc(100% - 29vh)"
          tooltip-effect="dark"
          style="width: 100%"
          @selection-change="handleSelectionChange1">
          <el-table-column
            type="selection"
            width="55"
            :selectable="selectInit">
          </el-table-column>
          <el-table-column
            sortable
            prop="course_id"
            label="course_id"
            width="140">
          </el-table-column>
          <el-table-column
            prop="course_name"
            label="course_name"
            width="300">
          </el-table-column>
          <el-table-column
            prop="Prerequisite"
            label="Prerequisite">
          </el-table-column>
          <el-table-column
            prop="Restriction"
            label="Restriction"
            width="190"
            show-overflow-tooltip>
          </el-table-column>
        </el-table>
        <!--        ELECTIVE COURSE-->

        <!--        NOTES-->
        <h2 style="display: inline-block;color: white"><i class="el-icon-edit"></i>Notes:</h2>
        <el-tooltip class="item" effect="dark" content="The course selection summary information will be displayed"
                    placement="top">
          <el-button type="success" style="display: inline-block;
          float: right;
          margin-top: 2vh;
          margin-right: 2vw" @click="submit">Submit selection
          </el-button>
        </el-tooltip>
        <!--        NOTES-->

        <!--        SELECT RESULT-->
        <el-dialog
          title="Course selection results"
          :visible.sync="dialogTableVisible"
          center
          append-to-body
          width="75%" top="8vh">
          <el-table :data="tData" style="width: 100%" height="600">
            <el-table-column prop="course_id" label="course_id" width="140"></el-table-column>
            <el-table-column prop="course_name" label="course_name" width="300"></el-table-column>
            <el-table-column prop="Prerequisite" label="Prerequisite"></el-table-column>
            <el-table-column prop="nature" label="nature"
                             width="120"
                             :filters="[{ text: 'compulsory', value: 'compulsory' }, { text: 'elective', value: 'elective' }]"
                             :filter-method="filterNature"
                             filter-placement="bottom-end">
              <template slot-scope="scope">
                <el-tag
                  :key=scope.row.nature
                  :type=scope.row.type
                  effect="dark">
                  {{ scope.row.nature }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column
              prop="tag"
              label="year"
              width="110"
              :filters="[{ text: 'year1', value: 'year1' }, { text: 'year2', value: 'year2' }, { text: 'year3', value: 'year3' }]"
              :filter-method="filterTag"
              filter-placement="bottom-end">
              <template slot-scope="scope">
                <el-select v-model="scope.row.tag" v-show="scope.row.stated===1">
                  <el-option
                    v-for="item in options"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                  </el-option>
                </el-select>
                <span v-show="scope.row.stated===0">{{ scope.row.tag }}</span>
              </template>
            </el-table-column>
            <el-table-column
              label="opera"
              width="70">
              <template slot-scope="scope">
                <el-tooltip effect="dark" content="editable" placement="top">
                  <el-button icon="el-icon-edit-outline" type="text" @click="edit(scope.row, scope)"></el-button>
                </el-tooltip>
                <el-tooltip effect="dark" content="save edition" placement="top">
                  <el-button icon="el-icon-download" type="text" @click="save(scope.row)"></el-button>
                </el-tooltip>
              </template>
            </el-table-column>
          </el-table>
          <div slot="footer" class="dialog-footer">
            <el-button @click="dialogTableVisible = false">cancel</el-button>
            <el-popover
              placement="top-start"
              title="Tips"
              width="200"
              trigger="hover"
              content="Please make sure your selections are submitted before generating the report">
              <el-button type="primary" slot="reference" @click="generatePdf">Generate report</el-button>
            </el-popover>
          </div>
        </el-dialog>
        <!--        SELECT RESULT-->

        <!--        SHOW COURSE_DESCRIBE-->
        <div style="width: auto;
        height: 16vh;
        text-align: center;
        line-height: 16vh;
        background-color: rgba(100,149,237,0.4);
        margin-left: 3vw; border-radius: 2vh"><h3 style="color: red">{{ this.noteInfo }}</h3></div>
        <!--        SHOW COURSE_DESCRIBE-->

      </el-col>
      <!--      COURSE-->

      <!--      INFO-->
      <el-col :span="7" style="padding-top: 2vh; padding-right: 1.5vw">
        <div class="main">
          <!--          DIRECTION COURSE-->
          <el-card class="box-card">
            <div slot="header">
              <h2 style="margin-block-start: 0;margin-block-end: 0;">Path recommended</h2>
            </div>
            <div style="overflow-y: scroll; height: 35vh">
              <el-tag
                v-for="item in items"
                :key="item.label"
                :type="item.type"
                effect="dark">
                {{ item.label }}
              </el-tag>
            </div>
          </el-card>
          <!--          DIRECTION COURSE-->

          <!--          MAJOR AND DIRECTION-->
          <div style="height: 7vh">
            <el-col :span="12"><h2 style="color: darkcyan; margin-block-end:0.4em">
              <i class="el-icon-star-on" style="color: #0422ea"></i>
              major</h2></el-col>
            <el-col :span="12"><h2 style="color: darkcyan; margin-block-end:0.4em">
              <i class="el-icon-s-promotion" style="color: deeppink"></i>
              path</h2></el-col>
          </div>
          <div style="height: 10vh">
            <el-col :span="12">
              <h3 style="word-break: break-all;word-wrap: break-word;">{{ this.major }}</h3>
            </el-col>
            <el-col :span="12">
              <h3 style="word-break: break-all;word-wrap: break-word;">{{ this.direction }}</h3>
            </el-col>
          </div>
          <!--          MAJOR AND DIRECTION-->

          <!--          POINTS-->
          <div><h2 style="color: darkcyan">
            <i class="el-icon-document-checked" style="color: darkmagenta"></i>
            credit</h2>
          </div>
          <div>
            <h3>{{ $store.state.points + $store.state.points1 }} points</h3>
          </div>
          <!--          POINTS-->

          <!--          EXIT SYSTEM-->
          <div style="padding-top: 2vh">
            <el-button circle type="danger" icon="el-icon-switch-button" @click="LoginOut"></el-button>
          </div>
          <!--          EXIT SYSTEM-->

        </div>
      </el-col>
      <!--      INFO-->

    </el-row>
    <!--    MAIN-->
  </div>
</template>

<script>
export default {
  name: "home",
  inject: ['reload'],
  data() {
    return {
      items: '',
      radio: 'Compulsory',  // 默认展示必修课程
      options: [{
        value: 'year1',
        label: 'year1'
      }, {
        value: 'year2',
        label: 'year2'
      }, {
        value: 'year3',
        label: 'year3'
      }],
      tData: [],
      gridData: [],
      flag: [],
      gridData1: [],
      flag1: [],
      dialogTableVisible: false,
      noteInfo: '',
      multipleSelection: [],
      major: sessionStorage.getItem('major'),   // 从浏览器缓存中获取major
      direction: sessionStorage.getItem('direction'),   // 从浏览器缓存中获取direction
      tableData: [],
      tableData1: [],
    }
  },
  // 每刷新页面便会执行一遍
  created() {
    this.getCourse();
    this.getOtherCourse();
    this.getDirectionCourse();
  },
  // 页面调用的函数
  methods: {
    filterNature(value, row) {
      return row.nature === value;
    },
    filterTag(value, row) {
      return row.tag === value;
    },
    // 用于切换设置课程的学年的编辑状态
    edit(row, index) {
      row.stated = 1;
    },
    save(row) {
      row.stated = 0;
    },
    // 提交学生选课结果给后台
    submit() {
      this.dialogTableVisible = true
      this.$axios.post(`${this.$settings.HOST}/course/submit/`, {
        msg: this.gridData,
        msg1: this.gridData1
      }).then(response => {
        // 接收后台响应的数据
        this.tData = response.data
      }).catch(error => {
        console.log(error.response.data)
      });
    },
    // 表格选择触发函数（每选择一次就会运行一遍）
    handleSelectionChange(val) {
      this.gridData = val;
      const names = []
      const introduction = []
      for (const i in val) {
        names.push(val[i]["Restriction"])
      }
      this.flag = names;
      // 调用处理互斥课程的函数
      this.conflict(names, this.flag1);
      for (const j in val) {
        introduction.push(val[j]["Prerequisite"])
      }
      this.showNote(introduction);
      this.$store.commit("cac_points", val.length * 15);
    },
    // 同上
    handleSelectionChange1(val) {
      this.gridData1 = val;
      const names = []
      const introduction = []
      for (const i in val) {
        names.push(val[i]["Restriction"])
      }
      this.flag1 = names;
      this.conflict(names, this.flag);
      for (const j in val) {
        introduction.push(val[j]["Prerequisite"])
      }
      this.showNote(introduction);
      this.$store.commit("cac_points1", val.length * 15);
    },
    // 讲互斥课程的数据返回给后台
    conflict(arr, data) {
      this.$axios.post(`${this.$settings.HOST}/course/conflict/`, {
        'array': arr.concat(data)
      }).then(response => {
        this.multipleSelection = response.data;
      }).catch(error => {
        this.$message.error('处理失败')
        console.log(error.response.data);
      });
    },
    // 展示课程简介函数
    showNote(val) {
      this.$axios.post(`${this.$settings.HOST}/course/handle/`, {
        'msg': val
      }).then(response => {
        this.noteInfo = response.data;
      }).catch(error => {
        this.$message.error('返回note失败')
        console.log(error.response.data);
      });
    },
    // 处理课程禁选函数
    selectInit(row, index) {
      // 如果某行course_id在multipleSelection里面，则返回False，触发禁选
      return !this.multipleSelection.includes(row.course_id);
    },
    // 获取必修课程函数
    getCourse() {
      this.$axios.get(`${this.$settings.HOST}/course/info/`, {
        params: {'name': sessionStorage.getItem('major')}
      }).then(response => {
        this.tableData = response.data
      }).catch(error => {
        this.$message.error('获取课程信息失败')
        console.log(error.response.data)
      });
    },
    // 获取选修课程函数
    getOtherCourse() {
      this.$axios.get(`${this.$settings.HOST}/course/info/many/`, {
        // 携带参数字典返回给后台
        params: {'name': sessionStorage.getItem('major')}
      }).then(response => {
        this.tableData1 = response.data
      }).catch(error => {
        this.$message.error('获取选修课程信息失败')
        console.log(error.response.data)
      });
    },
    // 获取方向课程，用于展示
    getDirectionCourse() {
      this.$axios.post(`${this.$settings.HOST}/course/direction/course/`, {
        direction: sessionStorage.getItem('direction')
      }).then(response => {
        this.items = response.data
      }).catch(error => {
        console.log(error.response.data)
      });
    },
    // 退出系统
    LoginOut() {
      // 定义交互弹出框
      this.$msgbox({
        title: 'message',
        message: "Are you sure to exit the system?",
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
        beforeClose: (action, instance, done) => {
          if (action === 'confirm') {
            instance.confirmButtonLoading = true;
            instance.confirmButtonText = 'wait...';
            setTimeout(() => {
              done();
              setTimeout(() => {
                instance.confirmButtonLoading = false;
              }, 300);
            }, 500);
          } else {
            done();
          }
        }
      }).then(action => {
        // 点击确定后执行以下事件
        this.$router.push('/login');  // 返回登录页面
        sessionStorage.removeItem('user_id');   // 移除浏览器的缓存数据（同下）
        sessionStorage.removeItem('user_name');
        sessionStorage.removeItem('major');
        sessionStorage.removeItem('direction');
        this.$store.commit("cac_points", 0);  // 初始化points计数器
        this.$store.commit("cac_points1", 0);
      });
    },
    // 生成pdf函数
    generatePdf() {
      this.$axios.post(`${this.$settings.HOST}/course/pdf/`, {
        data: this.tData,
        major: sessionStorage.getItem('major'),
        direction: sessionStorage.getItem('direction'),
        points: this.$store.state.points + this.$store.state.points1,
      }).then(response => {
        // 定义接收后台的数据格式
        let blob = new Blob([response.data], {
          type: 'application/pdf'
        })
        let eLink = document.createElement('a')
        // 定义生成的pdf名字（默认用学生所选的major命名）
        eLink.download = sessionStorage.getItem('major')
        eLink.style.display = 'none'
        eLink.href = URL.createObjectURL(blob)
        document.body.appendChild(eLink)
        eLink.click()
        URL.revokeObjectURL(eLink.href)
        document.body.removeChild(eLink)
        this.$message.success('Report generation succeeded');
        this.gridData = this.gridData1 = [];
        this.$store.commit("cac_points", 0);
        this.$store.commit("cac_points1", 0);
        // 关闭课程结果展示的弹窗
        this.dialogTableVisible = false;
        // 刷新页面
        this.reload();
      }).catch(error => {
        console.log(error.response.data);
      });
    }
  }
}
</script>

<style scoped>
h1 {
  margin-block-start: 2em;
  width: 21vw;
}

h3 {
  color: white;
}

>>> .el-table thead {
  color: rgb(0, 70, 127);
}

/deep/ .el-table__header-wrapper .el-checkbox {
  display: none
}

.main {
  width: auto;
  height: 83vh;
  border-radius: 4vh;
  text-align: center;
}

.nav {
  width: auto;
  height: 12vh;
}

.box-card {
  height: 42vh;
  margin-bottom: 2vh;
  border-radius: 4vh;
  background-color: rgba(255, 255, 255, 0.28);
}

>>> .el-card__header {
  padding: 12px 20px;
}

.el-tag {
  margin: 0.5vh 0.5vw;
}

>>> .el-card__body, .el-main {
  padding: 10px 20px 20px;

}

.item {
  margin: 4px;
}
</style>
