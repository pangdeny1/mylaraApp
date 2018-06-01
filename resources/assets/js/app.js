import vue from "vue";
import "./bootstrap";
import RoleAssignmentForm from "./components/RoleAssignmentForm";

window.Vue = vue;

Vue.component('role-assignment-form', RoleAssignmentForm);

const app = new Vue({
    el: '#app'
});
