<script>
import Axios from "axios";

export default {
  data() {
    return {
      farmer: "",
      blocks: [],
      errors: []
    };
  },
  computed: {
    hasBlock() {
      return Boolean(this.blocks.length);
    }
  },
  watch: {
    farmer(id) {
      this.fetchBlocksByFarmerId(id);
    }
  },
  methods: {
    fetchBlocksByFarmerId(id) {
      Axios.get(`/api/farmers/${id}/blocks`)
        .then(({ data }) => {
          this.blocks = data;
        })
        .catch(({ data }) => {
          this.errors = data;
        });
    }
  }
};
</script>
