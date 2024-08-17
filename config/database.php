<?php
class Database
{
    private $host = "localhost";
    private $db_name = "penjualan"; 
    private $username = "root";
    private $password = "";
    private $conn;

    public function __construct()
    {
        $this->conn = new mysqli($this->host, $this->username, $this->password, $this->db_name);

        if ($this->conn->connect_error) {
            die("Connection failed: " . $this->conn->connect_error);
        }
    }

    // Method untuk membuat query view table
    public function createTop3KategoriView()
    {
        $query = "
        CREATE OR REPLACE VIEW top_3_kategori_terjual AS
        SELECT
            b.kategori,
            COUNT(d.kode_barang) AS jumlah_barang_terjual
        FROM
            tr_d d
        JOIN
            m_barang b ON d.kode_barang = b.kode_barang
        JOIN
            tr_h h ON d.kode_trx = h.kode_trx
        WHERE
            YEAR(h.tgl_trx) = YEAR(CURDATE())
        GROUP BY
            b.kategori
        ORDER BY
            jumlah_barang_terjual DESC
        LIMIT 3;
        ";

        if ($this->conn->query($query) === TRUE) {
            echo "<script>alert('View top_3_kategori_terjual created successfully.');</script>";

        } else {
            echo "Error creating view: " . $this->conn->error;
        }
    }

    public function getTop3Kategori()
    {
        $this->createTop3KategoriView();
        $query = "SELECT * FROM top_3_kategori_terjual";
        $result = $this->conn->query($query);
        $data = [];
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
        }
        return $data;
    }

    public function close()
    {
        $this->conn->close();
    }
}

