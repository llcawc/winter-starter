<?php

return [
    'plugin' => [
        'name' => 'Документация',
        'desc' => 'Простая документация для сайта',
    ],
    'component' => [
        'item' => [
            'name' => 'Страницы документации',
            'desc' => 'Выводит по отдельности страницы документации',
            'prop' => [
                'slug_title' => 'Параметр URL',
                'slug_desc' => 'Параметр маршрута, используемый для определения записи (документа) по его URL.',
                'stek_title' => 'Подсветка',
                'stek_desc' => 'Стек языков программирования и технологий для которых будет выполнятся подсветка кода.',
                'stek_all' => 'Все языки',
                'stek_wn' => 'Стек Winter CMS',
                'theme_title' => 'Тема подсветки кода',
            ],
        ],
        'menu' => [
            'name' => 'Меню документации',
            'desc' => 'Выводит ссылки на страницы документации',
            'prop' => [
                'doc_page_title' => 'Страница записи',
                'doc_page_desc' => 'Выберите страницу CMS выводящую отдельную запись документа. Это необходимо для формирования url-адресов пунктов меню.',
            ],
        ],
    ],
    'fields' => [
        'published' => 'Опубликовано',
        'created' => 'Создано',
        'updated' => 'Изменено',
        'title' => 'Название',
        'meta_img' => 'Meta-изображение',
        'tab_content' => 'Содержание',
        'repiter_prompt_css_files' => 'Добавить файл CSS',
        'label_add_url_css_files' => 'Укажите Url-адрес CSS-файла',
        'repiter_prompt_js_files' => 'Добавить файл JS',
        'label_add_url_js_files' => 'Укажите Url-адрес JS-файла',
        'title_placeholder' => 'Название записи',
        'slug_placeholder' => 'item-slug',
    ],
    'config' => [
        'name' => 'Документ',
        'create_title' => 'Создание записи',
        'edit_title' => 'Редактирование записи',
        'preview_title' => 'Предпросмотр записи',
        'list_title' => 'Список документации',
        'reorder_title' => 'Сортировка документов',
    ],
    'controller' => [
        'items' => 'Записи',
        'new' => 'Новая запись',
        'creating' => 'Создание записи...',
        'saving' => 'Сохранение записи...',
        'deleting' => 'Удаление записи...',
        'confirm_delete' => 'Удалить эту запись?',
        'reorder' => 'Сортировать записи',
        'data_window_close_confirm' => 'Запись не была сохранена после изменений. Хотите продолжить?',
    ],
];
