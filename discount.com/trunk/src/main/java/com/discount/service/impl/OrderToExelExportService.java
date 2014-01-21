package com.discount.service.impl;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;

import com.discount.domain.Cart;
import com.discount.domain.Product;
import com.discount.service.OrderExportService;

@Service("orderExportService")
public class OrderToExelExportService implements OrderExportService {

	@Override
	public String export(Cart cart) {
		String filename = "D:/" + cart.getUser().getFullName() + "Order.xls";
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("FirstSheet");

		int rowCounter = 0;

		HSSFRow rowhead = sheet.createRow(rowCounter);
		rowhead.createCell(0).setCellValue("Producer");
		rowhead.createCell(1).setCellValue("Product name");
		rowhead.createCell(2).setCellValue("Range");
		rowhead.createCell(3).setCellValue("Product category");
		rowhead.createCell(4).setCellValue("Price");
		rowhead.createCell(5).setCellValue("Count");

		Set<Entry<Product, Integer>> productsentrySet = cart.getProducts()
				.entrySet();

		for (Entry<Product, Integer> entry : productsentrySet) {
			Product product = entry.getKey();

			HSSFRow row = sheet.createRow(++rowCounter);
			row.createCell(0).setCellValue(product.getProducer().getName());
			row.createCell(1).setCellValue(product.getName());
			row.createCell(2).setCellValue(product.getRange().getName());
			row.createCell(3).setCellValue(product.getCategory().getName());
			row.createCell(4).setCellValue(product.getPrice());
			row.createCell(5).setCellValue(entry.getValue());
		}

		HSSFRow totalPriceRow = sheet.createRow(rowCounter + 2);
		totalPriceRow.createCell(0).setCellValue(
				"Total price: " + cart.getTotalPrice());
		FileOutputStream fileOut;
		try {
			fileOut = new FileOutputStream(filename);
			try {
				workbook.write(fileOut);
				fileOut.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("Your excel file has been generated!");

		return filename;
	}
}
