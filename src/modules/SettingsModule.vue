<template>
    <NavBar :tabs="settings_list" />
</template>

<script setup>
    import GeneralSettings from "./settings/GeneralSettings.vue"
    import AudioSettings from "./settings/AudioSettings.vue"
    import ControlSettings from "./settings/ControlSettings.vue"
    import GameplaySettings from "./settings/GameplaySettings.vue"
    import InterfaceSettings from "./settings/InterfaceSettings.vue"
    import SocialSettings from "./settings/SocialSettings.vue"
    import VideoSettings from "./settings/VideoSettings.vue"

    import NavBar from "../components/NavBar.vue"

    const settings_list = [
        GeneralSettings,
        AudioSettings,
        ControlSettings,
        GameplaySettings,
        InterfaceSettings,
        SocialSettings,
        VideoSettings
    ]
</script>