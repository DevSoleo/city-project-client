<template>
    <div class="mail-empty">
        <div class="message">
            <span>PAS DE MESSAGE CHEH</span>
        </div>
    </div>
</template>

<style>
    div.mail-empty {
        cursor: pointer;
        transition: 0.1s;
        border: 2px solid transparent;
        display: flex;
        justify-content: space-between;
        width: 100%;
        box-sizing: border-box;
        text-align: center;
    }

    div.mail-empty .message {
        width: 100%;
        display: flex;
        align-self: center;
    }

    div.mail-empty .message span {
        height : 100%;
        width: 100%;
    }
</style>