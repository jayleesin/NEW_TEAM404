function showEditRow(index) {
    const editRow = document.querySelector(`#edit-row-${index}`);
    editRow.style.display = 'table-row';
    const dataRow = document.querySelector(`#data-row-${index}`);
    dataRow.style.display = 'none';
};

function cancelRow(index) {
    const editRow = document.querySelector(`#edit-row-${index}`);
    editRow.style.display = 'none';
    const dataRow = document.querySelector(`#data-row-${index}`);
    dataRow.style.display = 'table-row';
};


