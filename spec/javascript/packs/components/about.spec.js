import { mount } from '@vue/test-utils'
import About from 'packs/components/about'

describe('About', () => {
    test('is a Vue instance', () => {
        const wrapper = mount(About)
        expect(wrapper.isVueInstance()).toBeTruthy()
    })
})
