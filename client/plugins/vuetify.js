import { createVuetify } from 'vuetify'
import { VBtn } from 'vuetify/lib/components/VBtn'
import { VCard } from 'vuetify/lib/components/VCard'
import { VCardText } from 'vuetify/lib/components/VCard'

const vuetify = createVuetify({
  components: {
    VBtn,
    VCard,
    VCardText
  }
})

export default vuetify