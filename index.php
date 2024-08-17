<?php
require_once 'config/database.php';
$database = new Database();
$data = $database->getTop3Kategori();
$database->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top 3 Kategori Terjual</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
    <div class="flex flex-col justify-center items-center h-screen">
        <h1 class="text-2xl font-bold mb-6">
            Top 3 Kategori Terjual Sepanjang Tahun Berjalan
        </h1>

        <table class="table-auto border-collapse border border-gray-300 w-[40%] text-center">
            <thead>
                <tr>
                    <th class="border border-gray-300 px-4 py-2">Kategori</th>
                    <th class="border border-gray-300 px-4 py-2">Jumlah Terjual</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($data as $row): ?>
                    <tr>
                        <td class="border border-gray-300 px-4 py-2"><?php echo htmlspecialchars($row['kategori']); ?></td>
                        <td class="border border-gray-300 px-4 py-2">
                            <?php echo htmlspecialchars($row['jumlah_barang_terjual']); ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>

</html>