import vue from "vue";
import "./bootstrap";
import RolesPicker from "./components/RolesPicker";
import CropsPicker from "./components/CropsPicker";
import FarmersPicker from "./components/FarmersPicker";

window.Vue = vue;

Vue.component('roles-picker', RolesPicker);
Vue.component('crops-picker', CropsPicker);
Vue.component('farmers-picker', FarmersPicker);

const app = new Vue({ el: '#app' });
