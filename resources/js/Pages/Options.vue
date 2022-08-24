<script setup>
import BreezeAuthenticatedLayout from '@/Layouts/Authenticated.vue';
import { Head } from '@inertiajs/inertia-vue3';
</script>

<template>
    <Head title="Options" />

    <BreezeAuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Настройки
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 bg-white border-b border-gray-200">
                        Пример страницы настроек бота
                    </div>
                    <div class="p-6 bg-white border-b border-gray-200">
                        <!-- The button to open modal -->
                        <label for="my-modal" class="btn modal-button">open modal</label>

                        <!-- Put this part before </body> tag -->
                        <input type="checkbox" id="my-modal" class="modal-toggle" />
                        <div class="modal">
                            <div class="modal-box">
                                <h3 class="font-bold text-lg">Congratulations random Internet user!</h3>
                                <p class="py-4">You've been selected for a chance to get one year of subscription to use Wikipedia for free!</p>
                                <div class="modal-action">
                                    <label for="my-modal" class="btn">Yay!</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </BreezeAuthenticatedLayout>
</template>
