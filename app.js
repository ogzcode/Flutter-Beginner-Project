Vue.component("input-side", {
    template: `
    <div class="input__side">
        <div class="input__box">
            <label>Email</label>
            <input id="email" type="email" placeholder="Enter Email" v-model="email"/>
        </div>
        <div class="input__box">
            <label>Password</label>
            <input id="password" type="text" placeholder="Enter Password" v-model="password"/>
        </div>
        <button class="save__btn" v-on:click="clickBtn">Save</button>
    </div>
    `,
    props: {
        email: {
            type: String,
            required: true
        },
        password: {
            type: String,
            required: true
        }
    },
    methods: {
        clickBtn(){
            if (this.email != "" && this.password != ""){
                this.$emit("send", {emailVal: this.email, passwordVal: this.password});
            }
        }
    }
});

Vue.component("data-item", {
    template: `
    <div class="item">
        <div class="item__left">
            <div class="item__row">
                <i class="fas fa-envelope"></i>
                <span>{{email}}</span>
            </div>
            <div class="item__row">
                <i class="fas fa-lock"></i>
                <span>{{password}}</span>
            </div>
        </div>
        <div class="item__right">
            <button class="item__btn delete--btn" v-on:click="deleteData">
                <i class="fas fa-trash"></i>
            </button>
            <button class="item__btn update--btn" v-on:click="updateData">
                <i class="fas fa-rotate"></i>
            </button>
        </div>
    </div>
    `,
    props: {
        email: {
            type: String,
            required: true
        },
        password: {
            type: String,
            required: true
        }
    },
    methods: {
        deleteData(){
            this.$emit("send-for-delete", this.$vnode.key);
        },
        updateData(){
            this.$emit("send-for-update", {emailVal: this.email, passwordVal: this.password, key: this.$vnode.key});
        }
    }
});

new Vue({
    el: "#app",
    data: {
        userData: [],
        userEmail: "",
        userPassword: ""
    },
    methods: {
        getData(dataObject){
            this.userData.push(dataObject);
            this.userEmail = "";
            this.userPassword = "";
        },
        deleteFromUser(key){
            this.userData.splice(key, 1);
        },
        updateFromUser(dataObject){
            this.userEmail = dataObject.emailVal;
            this.userPassword = dataObject.passwordVal;
            this.userData.splice(dataObject.key, 1);
        }
    }
});